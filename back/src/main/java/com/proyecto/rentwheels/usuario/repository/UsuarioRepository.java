package com.proyecto.rentwheels.usuario.repository;

import com.proyecto.rentwheels.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface UsuarioRepository extends JpaRepository<Usuario, UUID> {
    boolean existsByUsernameIgnoreCase(String username);

    Optional<Usuario> findFirstByUsername(String username);
}