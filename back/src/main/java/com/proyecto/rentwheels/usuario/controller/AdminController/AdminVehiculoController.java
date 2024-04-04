package com.proyecto.rentwheels.usuario.controller.AdminController;

import com.proyecto.rentwheels.usuario.service.AdminService;
import com.proyecto.rentwheels.vehiculo.dto.EditVehiculoDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;
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
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminVehiculoController {

    private final AdminService adminService;
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

    @Operation(summary = "Añades un vehiculo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "Creación del vehiculo",
                    content = {@Content(mediaType = "aplication/json",
                            array = @ArraySchema(schema = @Schema(implementation = Vehiculo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            [
                                                {
                                                      "id": "ac19c001-8c06-178e-818c-0687df90000e",
                                                      "nombre": "Picos",
                                                      "imagen": "https://st.depositphotos.com/2078351/2100/i/450/depositphotos_21008703-stock-photo-a-bread-peaks-over-white.jpg",
                                                      "descripcion": "picos",
                                                      "precio": 0.13,
                                                      "tags": [
                                                          "pan",
                                                          "integral"
                                                      ],
                                                      "categoria": {
                                                          "nombre": "Tapas"
                                                      }
                                                  }
                                            ]
                                            """
                            )}
                    )}),

            @ApiResponse(responseCode = "400",
                    description = "Error al crear un vehiculo",
                    content = @Content)
    })
    @PostMapping("/add/vehiculo")
    public ResponseEntity<GetAllDetailsDto> create (@RequestBody EditVehiculoDto nuevo) {

        Vehiculo v = adminService.createVehiculo(nuevo);

        return ResponseEntity
                .status(201)
                .body(GetAllDetailsDto.of(v));
    }

    @Operation(summary = "Edita un vehiculo existente")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "OK",
                    content = @Content(mediaType = "application/json",
                            array = @ArraySchema(schema = @Schema(implementation = Vehiculo.class)),
                            examples = @ExampleObject(
                                    value = """
                                              {
                                                "id": "7c9e6679-7425-40de-944b-e07fc1f90ae7",
                                                "combustion": "Hibrido",
                                                "modelo": {
                                                    "modelo": "Toyota Corolla",
                                                     "logo": "https://assets.stickpng.com/thumbs/580b585b2edbce24c47b2cdc.png"
                                                                         },
                                                "imagen": "https://kobemotor.es/wp-content/uploads/2023/12/Toyota-C-HR-140h-Advance.png",
                                                "transmision": "manual",
                                                "capacidadPasajeros": 5,
                                                "autonomia": 69000,
                                                "potencia": 100,
                                                "estado": "seminuevo",
                                                "numPuertas": 5,
                                                "disponible": true,
                                                "precioBase": 300.0
                                                }
                                            """
                            )
                    )
            ),
            @ApiResponse(responseCode = "404",
                    description = "Not Found",
                    content = @Content
            )
    })
    @PutMapping("/edit/vehiculo/{idVehiculo}")
    public GetAllDetailsDto editVehiculo (@RequestBody EditVehiculoDto edit, @PathVariable UUID idVehiculo){

        Vehiculo v = adminService.editVehiculo(edit, idVehiculo);

        return GetAllDetailsDto.of(v);
    }

    @Operation(summary = "Borra un vehiculo por su id")
    @ApiResponse(responseCode = "204 No Content",
            description = "Borrado con éxito",
            content = @Content)
    @DeleteMapping("/delete/vehiculo/{idVehiculo}")
    public ResponseEntity<?> delete(@PathVariable UUID idVehiculo) {
        adminService.deleteVehiculo(idVehiculo);
        return ResponseEntity.noContent().build();
    }


}
