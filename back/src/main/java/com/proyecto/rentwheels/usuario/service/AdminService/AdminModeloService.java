package com.proyecto.rentwheels.usuario.service.AdminService;

import com.proyecto.rentwheels.modelo.dto.EditModeloDto;
import com.proyecto.rentwheels.modelo.exception.EmptyModeloException;
import com.proyecto.rentwheels.modelo.exception.NotFoundModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AdminModeloService {

    private final ModeloRepository modeloRepository;

    public Page<Modelo> getAll (Pageable pageable){

        Page<Modelo> modelos = modeloRepository.findAll(pageable);

        if (modelos.isEmpty())
            throw new EmptyModeloException();

        return modelos;
    }

    public List<Modelo> getAllWithoutPage(){

        List<Modelo> modelos = modeloRepository.findAll();

        if (modelos.isEmpty())
            throw  new EmptyModeloException();

        return modelos;
    }

    public Modelo create (EditModeloDto nuevo){

        Modelo m = new Modelo();

        m.setLogo(nuevo.logo());
        m.setModelo(nuevo.modelo());

        return modeloRepository.save(m);
    }

    public Modelo edit (EditModeloDto edit, UUID idModelo) {

        Modelo m = modeloRepository.findById(idModelo)
                .orElseThrow(() -> new NotFoundModeloException());

        m.setLogo(edit.logo());
        m.setModelo(edit.modelo());

        return modeloRepository.save(m);
    }

    public int vehiculosDeUnModelo(UUID idModelo) {

        return modeloRepository.cantidadVehiculosDeUnModelo(idModelo);
    }

    public Page<Vehiculo> getVehiculoModelo(UUID idModelo, Pageable pageable) {
        Page<Vehiculo> vehiculos = modeloRepository.getVehiculoModeloWithPageble(idModelo, pageable);

        if (vehiculos.isEmpty())
            throw  new EmptyModeloException();

        return vehiculos;
    }

    public Modelo details (UUID id) {

        Optional<Modelo> modelo = modeloRepository.findById(id);

        if (modelo.isPresent())
            return modelo.get();

        throw new NotFoundModeloException();
    }

}
