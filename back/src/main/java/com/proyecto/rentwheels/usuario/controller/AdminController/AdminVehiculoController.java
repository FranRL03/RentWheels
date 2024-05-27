package com.proyecto.rentwheels.usuario.controller.AdminController;

import com.proyecto.rentwheels.usuario.service.AdminService.AdminModeloService;
import com.proyecto.rentwheels.usuario.service.AdminService.AdminVehiculoService;
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
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminVehiculoController {

    private final AdminVehiculoService adminVehiculoService;

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

        Page<Vehiculo> vehiculos = adminVehiculoService.findAll(pageable);

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
    public ResponseEntity<GetAllDetailsDto> create (@RequestPart("vehiculoCreate") EditVehiculoDto nuevo,
                                                    @RequestPart("file")MultipartFile file) {

        return ResponseEntity
                .status(201)
                .body(GetAllDetailsDto.of(adminVehiculoService.createVehiculo(nuevo, file)));
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
    public GetAllDetailsDto editVehiculo (@RequestPart("vehiculoEditado") EditVehiculoDto edit,
                                          @PathVariable UUID idVehiculo,
                                          @RequestPart("file") MultipartFile file){

        return GetAllDetailsDto.of(adminVehiculoService.editVehiculo(edit, idVehiculo, file));
    }

    @Operation(summary = "Borra un vehiculo por su id")
    @ApiResponse(responseCode = "204 No Content",
            description = "Borrado con éxito",
            content = @Content)
    @DeleteMapping("/delete/vehiculo/{idVehiculo}")
    public ResponseEntity<?> delete(@PathVariable UUID idVehiculo) {
        adminVehiculoService.deleteVehiculo(idVehiculo);
        return ResponseEntity.noContent().build();
    }

    @DeleteMapping("/clear/modelo/{idModelo}")
    public ResponseEntity<?> clearModelList (@PathVariable UUID idModelo){

        adminVehiculoService.clearModelList(idModelo);

        return ResponseEntity.noContent().build();
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
                                                "disponible": true,
                                                "precioBase": 275.0
                                            }
                                            """
                            )}
                    )}),

            @ApiResponse(responseCode = "500",
                    description = "Error al encontrar el vehiculo para mostrar los detalles",
                    content = @Content)
    })
    @GetMapping("/vehiculo-details/{id}")
    public GetAllDetailsDto details (@Valid @PathVariable UUID id) {

        Vehiculo v = adminVehiculoService.details(id);

        return GetAllDetailsDto.of(v);
    }

}
