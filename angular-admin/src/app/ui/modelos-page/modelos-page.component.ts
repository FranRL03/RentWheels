import { Component, TemplateRef } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModeloService } from '../../services/modelo.service';
import { Router } from '@angular/router';
import { ModeloDto } from '../../dto/modelo-dto';

@Component({
  selector: 'app-modelos-page',
  templateUrl: './modelos-page.component.html',
  styleUrl: './modelos-page.component.css'
})
export class ModelosPageComponent {

  logo!: string;

  logoSrc: string | ArrayBuffer | null | undefined = null;


  modeloCreate: ModeloDto = {
    modelo: ''
  }

  file!: File;
  loading = false;

  logoError: string = '';
  modeloError: string = '';

  constructor(private modalService: NgbModal, private service: ModeloService, private router: Router) { }

  crear() {

    this.validacion();
    this.loading = true;
    this.service.create(this.modeloCreate, this.file).subscribe(response => {
      console.log('Modelo añadido', response);
      this.modalService.dismissAll();
      setTimeout(() => {
        this.loading = false;
        window.location.reload();
      }, 2000);
    }, 
    error => {
      this.loading = false;
    });
  }

  onFileChange(event: any) {
    // this.file = event.target.files[0];
    const input = event.target as HTMLInputElement;
    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        this.logoSrc = e.target?.result;
      };
      // agregamos la imagen seleccionada al tipo de archivo file
      reader.readAsDataURL(input.files[0]);
      this.file = input.files[0];
    }
  }

  openBackDropCustomClass(content: TemplateRef<any>) {
    this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
  }

  validacion() {
    let errores = false;

    if (!this.logoSrc) {
      this.logoError = 'El logo no puede estar vacío';
      errores = true;
    }

    if (!this.modeloCreate.modelo || this.modeloCreate.modelo.trim() === '') {
      this.modeloError = 'El modelo no puede estar vacío';
      errores = true;
    }

    if (errores) {
      return console.log(errores);
    }
  }

}
