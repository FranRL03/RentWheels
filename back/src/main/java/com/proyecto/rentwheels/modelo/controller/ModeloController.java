package com.proyecto.rentwheels.modelo.controller;

import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.servicio.ModeloServicio;
import com.proyecto.rentwheels.usuario.dto.JwtUserResponse;
import com.proyecto.rentwheels.vehiculo.dto.GetVehiculosDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
public class ModeloController {

    private final ModeloServicio modeloServicio;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de modelos de coches", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Modelo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            [
                                                  {
                                                      "modelo": "Toyota Corolla",
                                                      "logo": "https://assets.stickpng.com/thumbs/580b585b2edbce24c47b2cdc.png"
                                                  },
                                                  {
                                                      "modelo": "Honda Civic",
                                                      "logo": "https://assets.stickpng.com/thumbs/5ec3e3f358550c0004427748.png"
                                                  }
                                            ]
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Error en la lista", content = @Content)
    })
    @Operation(summary = "getAllModels", description = "lista de modelos")
    @GetMapping("/modelo")
    public List<GetModeloDto> getAllModelo () {

        return modeloServicio.getAllList()
                .stream()
                .map(GetModeloDto::of)
                .toList();

    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de vehiculos de un modelo", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Modelo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            [
                                                  {
                                                           "id": "7c9e6679-7425-40de-944b-e07fc1f90ae7",
                                                           "imagen": "toyota1.png",
                                                           "modelo": "Toyota Corolla",
                                                           "combustion": "Electrico",
                                                           "transmision": "Automatico",
                                                           "disponible": true,
                                                           "precioBase": 220.0
                                                       },
                                                       {
                                                           "id": "2641c15b-3c06-4fe5-81d3-5a3deaa9d366",
                                                           "imagen": "toyota2.png",
                                                           "modelo": "Toyota Corolla",
                                                           "combustion": "Hibrido",
                                                           "transmision": "Automatico",
                                                           "disponible": true,
                                                           "precioBase": 208.5
                                                       }
                                            ]
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Error en la lista", content = @Content)
    })
    @Operation(summary = "getAllModels", description = "lista de vehiculos")
    @GetMapping("/modelo/vehiculo/{nombreModelo}")
    public List<GetVehiculosDto> getVehiculoModelos (@PathVariable String nombreModelo){


    return  modeloServicio.getVehiculoModelo(nombreModelo.toLowerCase())
            .stream()
            .map(GetVehiculosDto::of)
            .toList();

    }
}
