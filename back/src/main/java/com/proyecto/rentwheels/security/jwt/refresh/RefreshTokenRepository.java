package com.proyecto.rentwheels.security.jwt.refresh;

import com.proyecto.rentwheels.usuario.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.Optional;

public interface RefreshTokenRepository extends JpaRepository<RefreshToken, Usuario> {

    Optional<RefreshToken> findByToken(String token);

    @Modifying
    int deleteByUser(Usuario user);

}
