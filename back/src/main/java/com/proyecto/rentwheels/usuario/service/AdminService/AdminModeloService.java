package com.proyecto.rentwheels.usuario.service.AdminService;

import com.proyecto.rentwheels.files.service.StorageService;
import com.proyecto.rentwheels.modelo.dto.EditModeloDto;
import com.proyecto.rentwheels.modelo.dto.GetModeloConCantVehiculos;
import com.proyecto.rentwheels.modelo.dto.GetModeloDto;
import com.proyecto.rentwheels.modelo.exception.DeleteModeloException;
import com.proyecto.rentwheels.modelo.exception.EmptyModeloException;
import com.proyecto.rentwheels.modelo.exception.NotFoundModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.Banner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AdminModeloService {

    private final ModeloRepository modeloRepository;
    private final StorageService storageService;


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

    public Modelo create (EditModeloDto nuevo, MultipartFile file){

        Modelo m = new Modelo();

        String logoUrl = storageService.store(file);
        m.setLogo(logoUrl);
        m.setModelo(nuevo.modelo());

        return modeloRepository.save(m);
    }

    public Modelo edit (EditModeloDto edit, UUID idModelo, MultipartFile file) {

        Modelo m = modeloRepository.findById(idModelo)
                .orElseThrow(() -> new NotFoundModeloException());


        String logoUrl = storageService.store(file);
        m.setLogo(logoUrl);
        m.setModelo(edit.modelo());

        return modeloRepository.save(m);
    }

    public int vehiculosDeUnModelo(UUID idModelo) {

        return modeloRepository.cantidadVehiculosDeUnModelo(idModelo);
    }

    public Page<GetModeloConCantVehiculos> getAllModeloConCantidadVehiculos(Pageable pageable) {
        return modeloRepository.findAll(pageable)
                .map(modelo -> new GetModeloConCantVehiculos(
                        modelo.getId().toString(),
                        modelo.getLogo(),
                        modelo.getModelo(),
                        vehiculosDeUnModelo(modelo.getId())));
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


    public void delete (UUID idModelo) {

        int cantVehiculos = modeloRepository.cantidadVehiculosDeUnModelo(idModelo);

        if (cantVehiculos > 0) {
            throw new DeleteModeloException();
        } else {
            modeloRepository.deleteById(idModelo);
        }

    }

}
