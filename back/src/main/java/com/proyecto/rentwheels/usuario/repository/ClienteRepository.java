package com.proyecto.rentwheels.usuario.repository;

import com.proyecto.rentwheels.usuario.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface ClienteRepository extends JpaRepository<Cliente, UUID> {


}