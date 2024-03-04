package com.proyecto.rentwheels.alquiler.service;

import com.proyecto.rentwheels.alquiler.dto.GetAlquileresCliente;
import com.proyecto.rentwheels.alquiler.repositry.AlquilerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AlquilerServicio {

    private final AlquilerRepository alquilerRepository;

    public Page<GetAlquileresCliente> getAlquileresCliente (Pageable pageable, UUID id){
        return alquilerRepository.getAllAlquileresCliente(pageable, id);
    }

}
