package com.proyecto.rentwheels.vehiculo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;

import java.net.URI;
import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class VehiculoNoDisponibleException extends ErrorResponseException {

    public VehiculoNoDisponibleException () {
        super (HttpStatus.BAD_REQUEST, of("Operación cancelada: El vehículo tiene alquileres asociados o no está disponible"), null);
    }

    public static ProblemDetail of(String message) {
        ProblemDetail problemDetail = ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, message);
        problemDetail.setTitle("Borrado de vehículo restringido");
        problemDetail.setProperty("entityType", "Vehiculo");
        problemDetail.setProperty("timestamp", Instant.now().atZone(ZoneId.systemDefault())
                .format(DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm")));
        return problemDetail;
    }
}
