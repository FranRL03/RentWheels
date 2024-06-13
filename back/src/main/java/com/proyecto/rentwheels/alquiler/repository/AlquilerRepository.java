package com.proyecto.rentwheels.alquiler.repository;

import com.proyecto.rentwheels.alquiler.dto.GetAllAlquileres;
import com.proyecto.rentwheels.alquiler.dto.GetAlquileresCliente;
import com.proyecto.rentwheels.alquiler.dto.PriceAlquilerDto;
import com.proyecto.rentwheels.alquiler.model.Alquiler;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.UUID;

public interface AlquilerRepository extends JpaRepository<Alquiler, UUID> {

    @Query("""
            select new com.proyecto.rentwheels.alquiler.dto.PriceAlquilerDto(a.precio, a.fechaCreacion)
            from Alquiler a
            where a.cliente.id = :id
            order by a.fechaCreacion desc
            """)
    List<PriceAlquilerDto> getPriceAlquileresCliente(UUID id);

    @Query("""
            select a
            from Alquiler a
            where a.cliente.id = :id
                and a.enAlquiler = :statusRent
            order by a.fechaCreacion desc
            """)
    Page<GetAlquileresCliente> getAlquileresActivosCliente(Pageable pageable, UUID id, boolean statusRent);

    @Query("""
            select a
            from Alquiler a
            order by a.fechaCreacion desc
            """)
    Page<GetAllAlquileres> allAlquileres(Pageable pageable);

    @Query("""
            select a
            from Alquiler a
            where a.enAlquiler = :statusRent
            order by a.fechaCreacion desc
            """)
    Page<GetAllAlquileres> getAlquileresActivosExpirados(Pageable pageable, boolean statusRent);

    @Query("""
            select count(a)
            from Alquiler a 
            where a.vehiculo.id = ?1
            """)
int findByVehiculoId(UUID vehiculoId);
}
