package com.proyecto.rentwheels.usuario.controller.AdminController;

import com.proyecto.rentwheels.modelo.dto.EditModeloDto;
import com.proyecto.rentwheels.modelo.dto.GetModeloConCantVehiculos;
import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.servicio.ModeloServicio;
import com.proyecto.rentwheels.usuario.dto.JwtUserResponse;
import com.proyecto.rentwheels.usuario.service.AdminService.AdminModeloService;
import com.proyecto.rentwheels.validacion.annotacion.ValidFile;
import com.proyecto.rentwheels.vehiculo.dto.EditVehiculoDto;
import com.proyecto.rentwheels.vehiculo.dto.GetAllDetailsDto;
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
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.util.Collections;
import java.util.List;
import java.util.UUID;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin")
@Validated
public class AdminModeloController {

    private final AdminModeloService modeloServicio;

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
    @GetMapping("/modelo/no-page")
    public List<GetModeloDto> getAllModeloWithoutPage () {

        return modeloServicio.getAllWithoutPage()
                .stream()
                .map(GetModeloDto::of)
                .toList();

    }

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
    public Page<GetModeloConCantVehiculos> getAllModelo(@PageableDefault(page = 0, size = 6) Pageable pageable) {
        return modeloServicio.getAllModeloConCantidadVehiculos(pageable);
    }

    @Operation(summary = "Añades un vehiculo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "201",
                    description = "Creación del modelo",
                    content = {@Content(mediaType = "aplication/json",
                            array = @ArraySchema(schema = @Schema(implementation = Modelo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                  "modelo": "Acura",
                                                  "logo": "https://seeklogo.com/images/A/Acura-logo-6A7CD0D53A-seeklogo.com.png"
                                              }
                                            """
                            )}
                    )}),

            @ApiResponse(responseCode = "400",
                    description = "Error al crear un modelo",
                    content = @Content)
    })
    @PostMapping("/add/modelo")
    public ResponseEntity<GetModeloDto> create (@Valid @RequestPart("modeloCreate") EditModeloDto nuevo,
                                                @RequestPart("file") MultipartFile file) {

        return ResponseEntity
                .status(201)
                .body(GetModeloDto.of(modeloServicio.create(nuevo, file)));
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

    @PutMapping("/edit/modelo/{idModelo}")
    public GetModeloDto editModelo (@Valid @RequestPart("modeloEditado") EditModeloDto edit,
                                    @PathVariable UUID idModelo,
                                    @RequestPart("file") MultipartFile file){


        return GetModeloDto.of(modeloServicio.edit(edit, idModelo, file));
    }

    @GetMapping("/modelo/vehiculo/{idModelo}")
    public Page<GetVehiculosDto> getVehiculoModelos (@PathVariable UUID idModelo, @PageableDefault(page=0, size =6) Pageable pageable){


        Page<Vehiculo> vehiculoModelos = modeloServicio.getVehiculoModelo(idModelo, pageable);

        return vehiculoModelos.map(GetVehiculosDto::of);

    }

    @Operation(summary = "Detalles modelo")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200",
                    description = "Detalles un modelo",
                    content = {@Content(mediaType = "aplication/json",
                            array = @ArraySchema(schema = @Schema(implementation = Vehiculo.class)),
                            examples = {@ExampleObject(
                                    value = """
                                            {
                                                  "modelo": "Acura",
                                                  "logo": "https://seeklogo.com/images/A/Acura-logo-6A7CD0D53A-seeklogo.com.png"
                                              }
                                            """
                            )}
                    )}),

            @ApiResponse(responseCode = "500",
                    description = "Error al encontrar el modelo para mostrar los detalles",
                    content = @Content)
    })
    @GetMapping("/modelo/{id}")
    public GetModeloDto details (@PathVariable UUID id) {

        Modelo m = modeloServicio.details(id);

        return GetModeloDto.of(m);
    }

    @Operation(summary = "Borra un modelo por su id")
    @ApiResponse(responseCode = "204 No Content",
            description = "Borrado con éxito",
            content = @Content)
    @DeleteMapping("/delete/modelo/{idModelo}")
    public ResponseEntity<?> delete(@PathVariable UUID idModelo) {
        modeloServicio.delete(idModelo);
        return ResponseEntity.noContent().build();
    }
}
