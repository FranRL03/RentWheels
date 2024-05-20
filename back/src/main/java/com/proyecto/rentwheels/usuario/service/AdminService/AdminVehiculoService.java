package com.proyecto.rentwheels.usuario.service.AdminService;

import com.proyecto.rentwheels.alquiler.repository.AlquilerRepository;
import com.proyecto.rentwheels.modelo.exception.NotFoundModeloException;
import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.modelo.repositorio.ModeloRepository;
import com.proyecto.rentwheels.vehiculo.dto.EditVehiculoDto;
import com.proyecto.rentwheels.vehiculo.exception.EmptyVehiculosListException;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNoDisponibleException;
import com.proyecto.rentwheels.vehiculo.exception.VehiculoNotFoundException;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import com.proyecto.rentwheels.vehiculo.repository.VehiculoRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AdminVehiculoService {

    private final VehiculoRepository vehiculoRepository;
    private final ModeloRepository modeloRepository;
    private final AlquilerRepository alquilerRepository;

    public Page<Vehiculo> findAll (Pageable pageable){

        Page<Vehiculo> vehiculos = vehiculoRepository.findAll(pageable);

        if (vehiculos.isEmpty())
            throw new EmptyVehiculosListException();

        return vehiculos;
    }


    public Vehiculo createVehiculo (EditVehiculoDto nuevoVehiculo) {

        Vehiculo v = new Vehiculo();

        v.setImagen(nuevoVehiculo.imagen());
        v.setCombustible(nuevoVehiculo.combustion());
        v.setTransmision(nuevoVehiculo.transmision());
        v.setCapacidadPasajeros(nuevoVehiculo.capacidadPasajeros());
        v.setAutonomia(nuevoVehiculo.autonomia());
        v.setPotencia(nuevoVehiculo.potencia());
        v.setEstado(nuevoVehiculo.estado());
        v.setNumPuertas(nuevoVehiculo.numPuertas());
        v.setDisponible(true);
        v.setPrecioBase(nuevoVehiculo.precioBase());

        Modelo modelo = modeloRepository.findByModeloIgnoreCase(nuevoVehiculo.modelo());

        if (modelo == null)
            throw new NotFoundModeloException();
        else
            v.setModelo(modelo);

        return vehiculoRepository.save(v);
    }

    public Vehiculo editVehiculo (EditVehiculoDto edit, UUID idVehiculo){

        Vehiculo v = vehiculoRepository.findById(idVehiculo)
                .orElseThrow(() -> new VehiculoNotFoundException(idVehiculo.toString()));

        if (!v.isDisponible()) {
            throw new VehiculoNoDisponibleException();
        } else {
            v.setImagen(edit.imagen());
            v.setCombustible(edit.combustion());
            v.setTransmision(edit.transmision());
            v.setCapacidadPasajeros(edit.capacidadPasajeros());
            v.setAutonomia(edit.autonomia());
            v.setPotencia(edit.potencia());
            v.setEstado(edit.estado());
            v.setNumPuertas(edit.numPuertas());
            v.setPrecioBase(edit.precioBase());
        }

        return vehiculoRepository.save(v);

    }

    public void deleteVehiculo(UUID idVehiculo) {

        int num = vehiculoRepository.comprobarDisponibilidad(idVehiculo);
        int numAlquiler = alquilerRepository.findByVehiculoId(idVehiculo);

        if(num == 0 || numAlquiler > 0)
            throw new VehiculoNoDisponibleException();
        else
            vehiculoRepository.deleteById(idVehiculo);

    }

    public void clearModelList (UUID idModelo) {

        modeloRepository.findById(idModelo)
                .ifPresentOrElse((modelo) -> vehiculoRepository.clearModelList(modelo.getId()),
                () -> { throw new NotFoundModeloException(); }
        );
    }

    public Vehiculo details (UUID id) {

        Optional<Vehiculo> v = vehiculoRepository.findById(id);

        if (v.isPresent())
            return v.get();

        throw new VehiculoNotFoundException(id.toString());
    }
}
