package com.proyecto.rentwheels.usuario.controller.AdminController;

import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.servicio.ModeloServicio;
import com.proyecto.rentwheels.usuario.dto.JwtUserResponse;
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

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminModeloController {

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
    @GetMapping("/modelo/no-page")
    public List<GetModeloDto> getAllModeloWithoutPage () {

        return modeloServicio.getAllWithoutPage()
                .stream()
                .map(GetModeloDto::of)
                .toList();

    }
}