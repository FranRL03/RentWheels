package com.proyecto.foodhub.usuario.repository;

import com.proyecto.foodhub.usuario.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface ClienteRepository extends JpaRepository<Cliente, UUID> {


}