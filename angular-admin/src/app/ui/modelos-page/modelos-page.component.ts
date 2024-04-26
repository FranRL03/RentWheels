import { Component, TemplateRef } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModeloService } from '../../services/modelo.service';
import { ModeloDetails } from '../../models/new-modelo.interface';
import { Router } from '@angular/router';

@Component({
  selector: 'app-modelos-page',
  templateUrl: './modelos-page.component.html',
  styleUrl: './modelos-page.component.css'
})
export class ModelosPageComponent {

  logo!: string;
  modelo!: string;

  logoError: string = '';
  modeloError: string = '';

  constructor(private modalService: NgbModal, private service: ModeloService, private router: Router) { }

  crear() {

    this.validacion();


    this.service.create(this.modelo, this.logo).subscribe((modelo: ModeloDetails) => {
      console.log('Modelo añadido', modelo);
      this.router.navigate([`/admin/modelos`]);
    });
  }

  openBackDropCustomClass(content: TemplateRef<any>) {
    this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
  }

  validacion() {
    let errores = false;

    if (!this.logo || this.logo.trim() === '') {
      this.logoError = 'Complete el campo';
      errores = true;
    }

    if (!this.modelo || this.modelo.trim() === '') {
      this.modeloError = 'Complete el campo';
      errores = true;
    }

    if (errores) {
      return console.log(errores);
    }
  }

}
