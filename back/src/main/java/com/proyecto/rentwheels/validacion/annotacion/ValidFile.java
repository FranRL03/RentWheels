package com.proyecto.rentwheels.validacion.annotacion;

import com.proyecto.rentwheels.validacion.validator.FileValidator;
import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.*;

@Documented
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.ANNOTATION_TYPE, ElementType.CONSTRUCTOR, ElementType.PARAMETER, ElementType.TYPE_USE})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {FileValidator.class})
public @interface ValidFile {
    Class<? extends Payload> [] payload() default{};
    Class<?>[] groups() default {};
    String message() default "Only pdf,xml,jpeg,jpg files are allowed";
}
