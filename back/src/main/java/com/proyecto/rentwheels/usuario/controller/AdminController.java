package com.proyecto.rentwheels.usuario.controller;

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
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {

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
    @GetMapping("/vehiculos")
    public Page<GetVehiculosDto> findAll(@PageableDefault(page = 0, size = 6) Pageable pageable){

        Page<Vehiculo> vehiculos = vehiculoServicio.findAll(pageable);

        return vehiculos.map(GetVehiculosDto::of);
    }

}
