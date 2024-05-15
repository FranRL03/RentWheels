package com.proyecto.rentwheels.usuario.service.AdminService;

import com.proyecto.rentwheels.alquiler.exception.EmptyAlquilerException;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import com.proyecto.rentwheels.alquiler.repository.AlquilerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdminAlquilerService {

    private final AlquilerRepository alquilerRepository;

    public Page<Alquiler> getAll (Pageable pageable) {

        Page<Alquiler> alquileres = alquilerRepository.findAll(pageable);

        if (alquileres.isEmpty())
            throw new EmptyAlquilerException();

        return alquileres;
    }
}
