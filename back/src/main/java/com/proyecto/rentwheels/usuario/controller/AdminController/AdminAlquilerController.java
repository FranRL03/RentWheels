package com.proyecto.rentwheels.usuario.controller.AdminController;

import com.proyecto.rentwheels.alquiler.dto.AlquilerDetailsDto;
import com.proyecto.rentwheels.alquiler.dto.GetAllAlquileres;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.modelo.dto.GetModeloConCantVehiculos;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.usuario.service.AdminService.AdminAlquilerService;
import com.proyecto.rentwheels.vehiculo.dto.GetVehiculosDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
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
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminAlquilerController {

    private final AdminAlquilerService alquilerService;

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de todos los alquileres", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Alquiler.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            [
                                                           {
                                                               "id": "e6d26b2c-ffcb-4859-b9b8-71a1d52042f6",
                                                               "fechaInicio": "15-04-2023",
                                                               "fechaFin": "22-07-2025",
                                                               "origen": "Mordor",
                                                               "destino": "La Comarca",
                                                               "enAlquiler": true,
                                                               "cliente": {
                                                                   "id": "1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61",
                                                                   "username": "fernando01",
                                                                   "avatar": "https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=",
                                                                   "email": "fernando@gmail.com",
                                                                   "telefono": "112332112",
                                                                   "pin": "2222"
                                                               }
                                                           },
                                                           {
                                                               "id": "b5812fc3-2e70-4a91-b63e-d29a9ee0b041",
                                                               "fechaInicio": "13-09-2023",
                                                               "fechaFin": "30-12-2023",
                                                               "origen": "Mordor",
                                                               "destino": "La Comarca",
                                                               "enAlquiler": false,
                                                               "cliente": {
                                                                   "id": "1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61",
                                                                   "username": "fernando01",
                                                                   "avatar": "https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=",
                                                                   "email": "fernando@gmail.com",
                                                                   "telefono": "112332112",
                                                                   "pin": "2222"
                                                               }
                                                           }
                                            ]
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Error en la lista", content = @Content)
    })
    @Operation(summary = "getAllModels", description = "lista de todos los alquileres")
    @GetMapping("/alquiler")
    public Page<GetAllAlquileres> getAllAlquileres(@PageableDefault(page = 0, size = 6) Pageable pageable) {
        return alquilerService.getAll(pageable);
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Lista de todos los alquileres", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Alquiler.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            [
                                                  {
                                                               "id": "e6d26b2c-ffcb-4859-b9b8-71a1d52042f6",
                                                               "fechaInicio": "15-04-2023",
                                                               "fechaFin": "22-07-2025",
                                                               "origen": "Mordor",
                                                               "destino": "La Comarca",
                                                               "enAlquiler": true,
                                                               "cliente": {
                                                                   "id": "1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61",
                                                                   "username": "fernando01",
                                                                   "avatar": "https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=",
                                                                   "email": "fernando@gmail.com",
                                                                   "telefono": "112332112",
                                                                   "pin": "2222"
                                                               }
                                                           }
                                            ]
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Error en la lista", content = @Content)
    })
    @Operation(summary = "getAllModels", description = "lista de todos los alquileres")
    @GetMapping("/alquiler/{statusRent}")
    public Page<GetAllAlquileres> getAlquileresActivosExpirados(@PageableDefault(page = 0, size = 6) Pageable pageable,
                                                                @PathVariable boolean statusRent) {
        return alquilerService.getAlquileresActivosExpirados(pageable, statusRent);
    }

    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Detalles de un alquiler", content = {
                    @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Alquiler.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                  "id": "e6d26b2c-ffcb-4859-b9b8-71a1d52042f6",
                                                  "precio": 287.91,
                                                  "kilometrosAnos": 16195,
                                                  "fechaCreacion": "01-03-2023",
                                                  "fechaInicio": "15-04-2023",
                                                  "fechaFin": "22-07-2025",
                                                  "origen": "Mordor",
                                                  "destino": "La Comarca",
                                                  "enAlquiler": true,
                                                  "vehiculo": {
                                                      "id": "0f8fad5b-d9cb-469f-a165-70867728950e",
                                                      "combustion": "Electrico",
                                                      "modelo": {
                                                          "id": "ec3c2e40-6892-4725-8670-4b79922fe7b3",
                                                          "modelo": "Kia Sportage",
                                                          "logo": "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c485.png"
                                                      },
                                                      "imagen": "https://www.pngall.com/wp-content/uploads/11/Red-Kia-PNG-Photos.png",
                                                      "transmision": "Manual",
                                                      "capacidadPasajeros": 5,
                                                      "autonomia": 266426,
                                                      "potencia": 107,
                                                      "estado": "Nuevo",
                                                      "numPuertas": 5,
                                                      "disponible": false,
                                                      "precioBase": 208.5
                                                  },
                                                  "cliente": {
                                                      "id": "1ce9c1c7-7a02-4c7f-bf69-6d0306cbed61",
                                                      "username": "fernando01",
                                                      "avatar": "https://media.istockphoto.com/id/92044396/es/foto/rana-con-gafas-de-sol.jpg?s=170667a&w=0&k=20&c=jEh4ZMUWU9Y3gx5odmT-LmbCGymtiBVzzEPerkawqm0=",
                                                      "email": "fernando@gmail.com",
                                                      "telefono": "112332112",
                                                      "pin": "2222"
                                                  }
                                              }
                                            """
                            )}
                    )}),
            @ApiResponse(responseCode = "404", description = "Error en los detalles", content = @Content)
    })
    @Operation(summary = "getAllModels", description = "detalles alquileres")
    @GetMapping("/alquiler-details/{id}")
    public AlquilerDetailsDto details (@PathVariable UUID id) {

        Alquiler a = alquilerService.details(id);

        return AlquilerDetailsDto.of(a);
    }
}
