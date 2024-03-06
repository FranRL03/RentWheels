package com.proyecto.rentwheels.alquiler.controller;

import com.proyecto.rentwheels.alquiler.dto.GetAlquileresCliente;
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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class AlquilerController {

    private final AlquilerServicio alquilerServicio;


    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Obtener lista de alquileres del cliente", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = GetAlquileresCliente.class)),
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
    @GetMapping("/cliente/alquiler")
    public Page<GetAlquileresCliente> getAlquileresClientes(@PageableDefault(page=0, size =10) Pageable pageable, @AuthenticationPrincipal Cliente c){
        return alquilerServicio.getAlquileresCliente(pageable, c.getId());
    }

}
