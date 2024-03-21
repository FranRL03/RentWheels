package com.proyecto.rentwheels.usuario.controller;

import com.proyecto.rentwheels.security.jwt.access.JwtProvider;
import com.proyecto.rentwheels.security.jwt.refresh.RefreshToken;
import com.proyecto.rentwheels.security.jwt.refresh.RefreshTokenException;
import com.proyecto.rentwheels.security.jwt.refresh.RefreshTokenRequest;
import com.proyecto.rentwheels.security.jwt.refresh.RefreshTokenService;
import com.proyecto.rentwheels.usuario.dto.*;
import com.proyecto.rentwheels.usuario.model.Cliente;
import com.proyecto.rentwheels.usuario.model.Usuario;
import com.proyecto.rentwheels.usuario.service.ClienteService;
import com.proyecto.rentwheels.usuario.service.UsuarioService;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class UsuarioController {

    private final UsuarioService userService;
    private final ClienteService clienteService;

    private final AuthenticationManager authManager;
    private final JwtProvider jwtProvider;
    private final RefreshTokenService refreshTokenService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Registrarme como Cliente", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = UserResponse.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "c0a84001-8c15-1042-818c-15828332000f",
                                                "username": "luismai",
                                                "avatar": "https://img.a.transfermarkt.technology/portrait/big/610461-1647594517.jpg?lm=1",
                                                "fullName": "Luis Miguel",
                                                "roles": [
                                                    "CLIENTE"
                                                ],
                                                "createdAt": null
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "Dato introducido inválido", content = @Content)
    })
    @Operation(summary = "createUser", description = "Registrarme como Cliente")
    @PostMapping("/auth/register")
    public ResponseEntity<UserResponse> createUserWithUserRole(@Valid @RequestBody CreateClientDto created) {
        Cliente cliente = userService.createUserWithUserRole(created);

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(UserResponse.fromUser(cliente));
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Logeo", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = JwtUserResponse.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "c0a84001-8c15-1cb9-818c-157d030f000e",
                                                "username": "luismi",
                                                "avatar": "https://images.ctfassets.net/86mn0qn5b7d0/featured-img-of-post-147629/b3ae746d78d5df9009780b0f72737d3a/featured-img-of-post-147629.jpg?fm=jpg&fl=progressive&q=50&w=1200&h=900&fit=fill",
                                                "fullName": "Luis Miguel",
                                                "roles": [
                                                    "CLIENTE"
                                                ],
                                                "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjMGE4NDAwMS04YzE1LTFjYjktODE4Yy0xNTdkMDMwZjAwMGUiLCJpYXQiOjE3MDExNjc1OTMsImV4cCI6MTcwMTI1Mzk5M30.gEitIh4OuXDBILSplw6IrAk0KU2sXFXMGmItsWWCtqpSiKY8x81WnI2aTwuXQ66RxIuml-uIU9_QcmhGFCKgUA"
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "401", description = "No se encuentra Usuario", content = @Content)
    })
    @Operation(summary = "login", description = "logeo")
    @PostMapping("/auth/login")
    public ResponseEntity<JwtUserResponse> login(@RequestBody LoginRequest loginRequest) {
        Authentication authentication =
                authManager.authenticate(
                        new UsernamePasswordAuthenticationToken(
                                loginRequest.getUsername(),
                                loginRequest.getPassword()
                        )
                );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = jwtProvider.generateToken(authentication);
        Usuario user = (Usuario) authentication.getPrincipal();
        refreshTokenService.deleteByUser(user);
        RefreshToken refreshToken = refreshTokenService.createRefreshToken(user);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(JwtUserResponse.of(user, token, refreshToken.getToken()));
    }


    @PostMapping("/refreshtoken")
    public ResponseEntity<?> refreshToken(@RequestBody RefreshTokenRequest refreshTokenRequest) {
        String refreshToken = refreshTokenRequest.getRefreshToken();

        return refreshTokenService.findByToken(refreshToken)
                .map(refreshTokenService::verify)
                .map(RefreshToken::getUser)
                .map(user -> {
                    String token = jwtProvider.generateToken(user);
                    refreshTokenService.deleteByUser(user);
                    RefreshToken refreshToken2 = refreshTokenService.createRefreshToken(user);
                    return ResponseEntity.status(HttpStatus.CREATED)
                            .body(JwtUserResponse.builder()
                                    .token(token)
                                    .refreshToken(refreshToken2.getToken())
                                    .build());
                })
                .orElseThrow(() -> new RefreshTokenException("Refresh token not found"));

    }

    @GetMapping("/admin/cliente")
    public List<Cliente> getAllClientes() {
        return clienteService.getAll();
    }

    @PostMapping("/auth/token")
    public ResponseEntity<Boolean> validatedToken(@RequestBody String token){
        return ResponseEntity.status(HttpStatus.ACCEPTED).body(jwtProvider.validateToken(token));
    }

    @PutMapping("/user/changePassword")
    public ResponseEntity<UserResponse> changePassword(@RequestBody ChangePasswordRequest changePasswordRequest,
                                                           @AuthenticationPrincipal Usuario loggedUser) {

        try {
            if (userService.passwordMatch(loggedUser, changePasswordRequest.getOldPassword())) {
                Optional<Usuario> modified = userService.editPassword(loggedUser.getId(), changePasswordRequest.getNewPassword());
                if (modified.isPresent())
                    return ResponseEntity.ok(UserResponse.fromUser(modified.get()));
            } else {
                throw new RuntimeException();
            }
        } catch (RuntimeException ex) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Password Data Error");
        }

        return null;
    }
}
