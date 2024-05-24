package com.proyecto.rentwheels.usuario.controller;

import com.proyecto.rentwheels.usuario.dto.EditClientDto;
import com.proyecto.rentwheels.usuario.dto.GetClienteDetailsDto;
import com.proyecto.rentwheels.usuario.model.Cliente;
import com.proyecto.rentwheels.usuario.service.ClienteService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequiredArgsConstructor
public class ClienteController {

    private final ClienteService clienteService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Detalles del cliente logueada", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetClienteDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61",
                                                "username": "fernando01",
                                                "avatar": "https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=",
                                                "email": "fernando@gmail.com",
                                                "telefono": "112332112",
                                                "pin": "2222"
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "No hay nadie logueado", content = @Content)
    })
    @Operation(summary = "Detalles", description = "Detalles del cliente")
    @GetMapping("/profile")
    public GetClienteDetailsDto detallesCliente (@AuthenticationPrincipal Cliente c){
        return GetClienteDetailsDto.of(c);
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Editar datos del Cliente loggeado", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetClienteDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                 "id": "1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61",
                                                 "username": "fernando01",
                                                 "avatar": null,
                                                 "email": "fran@gmail.com",
                                                 "telefono": "2222222",
                                                 "pin": "1111"
                                             }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "Dato introducido inválido", content = @Content)
    })
    @Operation(summary = "editLoggedUser", description = "Editar datos del Cliente loggeado")
    @PutMapping("/profile/edit")
    public GetClienteDetailsDto editLoggedUser(@Valid @RequestPart("editado") EditClientDto editado,
                                               @AuthenticationPrincipal Cliente c,
                                               @RequestPart("file") MultipartFile file){
        return GetClienteDetailsDto.of(clienteService.editCliente(editado,c, file));
    }
}
