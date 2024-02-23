package com.proyecto.rentwheels.vehiculo.repository;

import com.proyecto.rentwheels.vehiculo.dto.GetFindAllDto;
import com.proyecto.rentwheels.vehiculo.model.Vehiculo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.UUID;

public interface VehiculoRepository extends JpaRepository<Vehiculo, UUID> {

//    @Query("""
//            SELECT new com.proyecto.rentwheels.vehiculo.dto.GetFindAllDto(
//            v.marca,
//            v.modelo,
//            v.imagen,
//            v.precio,
//            v.tipoVehicuo
//            )
//            FROM Vehiculo v
//            """)
//    Page<GetFindAllDto> findAll(Pageable pageable);


    @Query("""
            select v from Vehiculo v
            """)
    Page<Vehiculo> findAll(Pageable pageable);
}
