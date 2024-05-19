package com.proyecto.rentwheels.usuario.service.AdminService;

import com.proyecto.rentwheels.alquiler.dto.GetAllAlquileres;
import com.proyecto.rentwheels.alquiler.exception.EmptyAlquilerException;
import com.proyecto.rentwheels.alquiler.repository.AlquilerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdminAlquilerService {

    private final AlquilerRepository alquilerRepository;

    public Page<GetAllAlquileres> getAll (Pageable pageable) {

        Page<GetAllAlquileres> alquileres = alquilerRepository.allAlquileres(pageable);

        if (alquileres.isEmpty())
            throw new EmptyAlquilerException();

        return alquileres;
    }

    public Page<GetAllAlquileres> getAlquileresActivosExpirados (Pageable pageable, boolean statusRent) {

        Page<GetAllAlquileres> alquileres;


            alquileres = alquilerRepository.getAlquileresActivosExpirados(pageable, statusRent);

        if (alquileres.isEmpty()) {
            throw new EmptyAlquilerException();
        }

        return alquileres;
    }

}
