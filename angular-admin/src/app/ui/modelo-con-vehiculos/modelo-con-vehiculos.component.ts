import { Component, OnInit, TemplateRef, inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModeloService } from '../../services/modelo.service';
import { ModeloDetails } from '../../models/new-modelo.interface';
import { Vehiculo } from '../../models/list-vehiculo.interface';
import { VehiculoService } from '../../services/vehiculo.service';

@Component({
  selector: 'app-modelo-con-vehiculos',
  templateUrl: './modelo-con-vehiculos.component.html',
  styleUrl: './modelo-con-vehiculos.component.css'
})
export class ModeloConVehiculosComponent{

  route: ActivatedRoute = inject(ActivatedRoute);
  idModelo!: string;

  modelo!: string;
  logo!: string;

  logoError: string = '';
  modeloError: string = '';

  vehiculoList!: Vehiculo[];
  selectedVehiculoId!: string

  totalVehiculos = 0; 
  vehiculosPorPagina = 10;
  pagina = 0;

  constructor(private modalService: NgbModal, private router: Router, private modeloService: ModeloService) {
    this.idModelo = this.route.snapshot.params['idModelo'];
  }

  openBackDropCustomClass(content: TemplateRef<any>) {
    this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
  }

  editar() {
    this.modeloService.edit(this.logo, this.modelo, this.idModelo).subscribe(() => {
      this.router.navigate([`/admin/modelos`]);
    })

  }

  goBack() {
    window.history.back();
  }

}
