package com.proyecto.rentwheels.vehiculo.controller;

import com.proyecto.rentwheels.vehiculo.dto.GetFindAllDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.service.VehiculoServicio;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/vehiculos")
public class VehiculoController {

    private final VehiculoServicio vehiculoServicio;

//    @GetMapping("/menu")
//    public List<GetFindAllDto> findAll(){
//
//        List<Vehiculo> vehiculos = vehiculoServicio.findAll();
//
//        return GetFindAllDto.of(vehiculos);
//    }


}
