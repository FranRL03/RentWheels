package com.proyecto.rentwheels.validacion.validator;

import com.proyecto.rentwheels.validacion.annotacion.ValidFile;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.web.multipart.MultipartFile;

public class FileValidator implements ConstraintValidator<ValidFile, MultipartFile> {

    @Override
    public void initialize(ValidFile validFile) {
        System.out.println("File validator initialized!!");
    }

    @Override
    public boolean isValid(MultipartFile multipartFile,
                           ConstraintValidatorContext constraintValidatorContext) {
        System.out.println("Validating file");
        String contentType = multipartFile.getContentType();
        assert contentType != null;
        return isSupportedContentType(contentType);
    }
    private boolean isSupportedContentType(String contentType) {
        return contentType.equals("multipart/form-data");
//                || contentType.equals("text/xml")
//                || contentType.equals("image/jpg")
//                || contentType.equals("image/jpeg");
    }
}
