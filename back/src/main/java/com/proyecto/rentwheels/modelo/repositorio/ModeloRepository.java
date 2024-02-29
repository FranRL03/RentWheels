package com.proyecto.rentwheels.modelo.repositorio;

import com.proyecto.rentwheels.modelo.model.Modelo;
import com.proyecto.rentwheels.usuario.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ModeloRepository extends JpaRepository<Modelo, UUID> {
}
