package com.proyecto.rentwheels.vehiculo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class VehiculoNotFoundException extends ErrorResponseException {

    public VehiculoNotFoundException (String id) {
        super(HttpStatus.NOT_FOUND, of("El vehículo con el id: " + id + "no se encuentra"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, message);
        problemDetail.setTitle("Vehículo no encontrado");
        problemDetail.setProperty("entityType", "Vehiculo");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
