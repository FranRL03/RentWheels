package com.proyecto.rentwheels.usuario.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.proyecto.rentwheels.usuario.model.Usuario;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class JwtUserResponse extends UserResponse {

    private String token;
    private String refreshToken;

    public JwtUserResponse(UserResponse userResponse) {
        id = userResponse.getId();
        username = userResponse.getUsername();
        roles=userResponse.getRoles();
        avatar = userResponse.getAvatar();
        createdAt = userResponse.getCreatedAt();
    }

    public static JwtUserResponse of (Usuario user, String token) {
        JwtUserResponse result = new JwtUserResponse(UserResponse.fromUser(user));
        result.setToken(token);
        return result;

    }

}

