package com.proyecto.rentwheels.vehiculo.controller;

import com.proyecto.rentwheels.vehiculo.dto.GetFindAllDto;
import com.proyecto.rentwheels.vehiculo.dto.GetVehiculosDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.service.VehiculoServicio;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.ExampleObject;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/vehiculos")
public class VehiculoController {

    private final VehiculoServicio vehiculoServicio;

    @Operation(summary = "Lista de menu de todos los vehiculos")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Lista de vehiculos",
                    content = {@Content(mediaType = "aplication/json",
                            array = @ArraySchema(schema = @Schema(implementation = Vehiculo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            [
                                                     {
                                                         "combustion": "ElÃ©ctrico",
                                                         "modeloDto": {
                                                             "modelo": "Kia Sportage"
                                                         },
                                                         "imagen": "https://assets.stickpng.com/thumbs/59db69d33752880e93e16efc.png",
                                                         "transmision": "Manual"
                                                     },
                                                     {
                                                         "combustion": "ElÃ©ctrico",
                                                         "modeloDto": {
                                                             "modelo": "Nissan Rogue"
                                                         },
                                                         "imagen": "https://assets.stickpng.com/thumbs/59db694b3752880e93e16eef.png",
                                                         "transmision": "AutomÃ¡tico"
                                                     },
                                            ]
                                            """
                            )}
                    )}),

            @ApiResponse(responseCode = "500",
                    description = "Error al mostrar la lista",
                    content = @Content)
    })
    @GetMapping("/menu")
    public Page<GetVehiculosDto> findAll(@PageableDefault Pageable pageable){

        Page<Vehiculo> vehiculos = vehiculoServicio.findAll(pageable);

        return vehiculos.map(GetVehiculosDto::of);
    }

    @Operation(summary = "Detalles vehiculo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Detalles un vehiculo",
                    content = {@Content(mediaType = "aplication/json",
                            array = @ArraySchema(schema = @Schema(implementation = Vehiculo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                 "id": "9b11dd61-4424-46c9-9daa-c5d70025c478",
                                                 "combustion": "Hibrido",
                                                 "modelo": {
                                                     "modelo": "Mercedes",
                                                     "logo": "https://assets.stickpng.com/thumbs/5ec3e30358550c0004427741.png"
                                                 },
                                                 "imagen": "https://assets.stickpng.com/thumbs/580b585b2edbce24c47b2c94.png",
                                                 "transmision": "Manual",
                                                 "capacidadPasajeros": 4,
                                                 "autonomia": 247587,
                                                 "potencia": 170,
                                                 "estado": "Nuevo",
                                                 "numPuertas": 5,
                                                 "disponible": true
                                             }
                                            """
                            )}
                    )}),

            @ApiResponse(responseCode = "500",
                    description = "Error al encontrar el vehiculo para mostrar los detalles",
                    content = @Content)
    })
    @GetMapping("/{id}")
    public GetFindAllDto details (@Valid @PathVariable String id) {

        Vehiculo v = vehiculoServicio.details(id);

        return GetFindAllDto.of(v);
    }

}
