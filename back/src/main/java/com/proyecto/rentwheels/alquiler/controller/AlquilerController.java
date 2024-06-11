package com.proyecto.rentwheels.alquiler.controller;

import com.proyecto.rentwheels.alquiler.dto.CreateAlquilerDto;
import com.proyecto.rentwheels.alquiler.dto.GetAlquileresCliente;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.alquiler.service.AlquilerServicio;
import com.proyecto.rentwheels.usuario.model.Cliente;
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
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class AlquilerController {

    private final AlquilerServicio alquilerServicio;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener lista de alquileres del cliente", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Alquiler.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                 "content": [
                                                     {
                                                         "id": "e6d26b2c-ffcb-4859-b9b8-71a1d52042f6",
                                                         "precio": 287.91,
                                                         "kilometrosPorAno": 16195,
                                                         "fechaInicio": "15-04-2023",
                                                         "fechaFin": "22-07-2023",
                                                         "vehiculo": {
                                                             "combustion": "Cable",
                                                             "modelo": {
                                                                 "modelo": "Kia",
                                                                 "logo": "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c485.png"
                                                             },
                                                             "imagen": "https://assets.stickpng.com/thumbs/59db69d33752880e93e16efc.png",
                                                             "transmision": "Manual",
                                                             "capacidadPasajeros": 5,
                                                             "autonomia": 266426,
                                                             "potencia": 107,
                                                             "estado": "Nuevo",
                                                             "numPuertas": 5,
                                                             "disponible": false
                                                         }
                                                     }
                                                 ]
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "500", description = "Lista de clientes vacia", content = @Content)
    })
    @Operation(summary = "getAlquileresClientes", description = "Obtener lista de los alquieres")
    @GetMapping("/cliente/alquiler/{statusRent}")
    public Page<GetAlquileresCliente> getAlquileresRentClientes(@PageableDefault(page=0, size =10) Pageable pageable, @AuthenticationPrincipal Cliente c, @PathVariable boolean statusRent){
        return alquilerServicio.getAlquileresRentCliente(pageable, c.getId(), statusRent);
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "201", description = "Hace run alquiler", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Alquiler.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                "id": "ac19c001-9006-1139-8190-06b6da3a0003",
                                                "precio": 275.0,
                                                "kilometrosAnos": 25000,
                                                "fechaCreacion": "11-06-2024",
                                                "fechaInicio": "17-06-2024",
                                                "fechaFin": "20-06-2024",
                                                "origen": "Sevilla",
                                                "destino": "Cádiz",
                                                "enAlquiler": true,
                                                "vehiculo": {
                                                    "id": "9b11dd61-4424-46c9-9daa-c5d70025c478",
                                                    "combustion": "Hibrido",
                                                    "modelo": {
                                                        "id": "fe3756a0-2262-4ec7-a924-95e0eefdaa15",
                                                        "modelo": "Mercedes",
                                                        "logo": "mercedes_logo.png"
                                                    },
                                                    "imagen": "mercedes1.png",
                                                    "transmision": "Manual",
                                                    "capacidadPasajeros": 4,
                                                    "autonomia": 247587,
                                                    "potencia": 170,
                                                    "estado": "Nuevo",
                                                    "numPuertas": 5,
                                                    "disponible": false,
                                                    "precioBase": 275.0
                                                }
                                            }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "400", description = "Error al alquilar", content = @Content)
    })
    @Operation(summary = "createAlquiler", description = "Alquiler")
    @PostMapping("/alquilar/{idVehiculo}")
    public ResponseEntity<GetAlquileresCliente> createAlquiler (@AuthenticationPrincipal Cliente c, @RequestBody CreateAlquilerDto create, @PathVariable String idVehiculo){

        Alquiler a = alquilerServicio.createAlquiler(idVehiculo, c, create);

        return ResponseEntity
                .status(201)
                .body(GetAlquileresCliente.of(a));
    }

}
