package com.proyecto.rentwheels.usuario.controller;

import com.proyecto.rentwheels.usuario.dto.GetClienteDetailsDto;
import com.proyecto.rentwheels.usuario.model.Cliente;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class ClienteController {

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Editar datos del Cliente loggeado", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetClienteDetailsDto.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "c0a801b2-8c0d-1417-818c-0d4421110003",
                                                "nombre": "pepe",
                                                "email": "pepe@gmail.com",
                                                "avatar": "https://noticiasdelaciencia.com/upload/images/12_2021/6754_ciencia-en-imagenes-este-murcielago-da-la-cara.jpg",
                                                "direccion": "C/Montaña nº3",
                                                "codPostal": "33133",
                                                "poblacion": "Valencia",
                                                "puntos": 100,
                                                "pedidos": [
                                                    {
                                                        "id": "c0a801b2-8c0d-1417-818c-0d4421e0000c",
                                                        "fecha": "2023-11-26T21:13:38.144181",
                                                        "estadoPedido": "CONFIRMADO",
                                                        "importeTotal": 6.3
                                                    }
                                                ]
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "Dato introducido inválido", content = @Content)
    })
    @Operation(summary = "editLoggedUser", description = "Editar datos del Cliente loggeado")
    @GetMapping("/profile")
    public GetClienteDetailsDto detallesCliente (@AuthenticationPrincipal Cliente c){
        return GetClienteDetailsDto.of(c);
    }
}
