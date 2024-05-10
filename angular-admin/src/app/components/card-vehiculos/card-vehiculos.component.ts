import { Component, EventEmitter, Input, OnInit, Output, PipeTransform, TemplateRef } from '@angular/core';
import { Transmision, Vehiculo } from '../../models/list-vehiculo.interface';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { AsyncPipe, DecimalPipe } from '@angular/common';
import { map, startWith, take } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { VehiculoService } from '../../services/vehiculo.service';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ModeloService } from '../../services/modelo.service';

@Component({
  selector: 'app-card-vehiculos',
  templateUrl: './card-vehiculos.component.html',
  styleUrl: './card-vehiculos.component.css',
})
export class CardVehiculosComponent implements OnInit {

  vehiculoList!: Vehiculo[];
  selectedVehiculoId!: string

  @Input() modeloId: string | undefined;

  totalVehiculos = 0;
  vehiculosPorPagina = 10;
  pagina = 0;
  id!: string;

  constructor(private service: VehiculoService, private router: Router, private modalService: NgbModal, private modeloService: ModeloService) { }

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    if (this.modeloId) {
      this.modeloService.vehiculosModelo(this.modeloId, this.pagina - 1).subscribe(resp => {
        this.vehiculoList = resp.content;
        this.vehiculosPorPagina = resp.pageable.pageSize;
        this.totalVehiculos = resp.totalElements;
      });
    } else {
      this.service.listVehiculos(this.pagina - 1).subscribe(resp => {
        this.vehiculoList = resp.content;
        this.vehiculosPorPagina = resp.pageable.pageSize;
        this.totalVehiculos = resp.totalElements;
      });
    }
  }

  edit(id: string) {
    this.router.navigate([`admin/vehiculo/form-edit/${id}`])
    console.log(id);
  }

  delete(id: string) {
    this.service.delete(id).subscribe();
    window.location.href = `http://localhost:4200/admin/coche`;
  }

  openVerticallyCentered(content: TemplateRef<any>, id: string) {
    this.selectedVehiculoId = id;
    this.modalService.open(content, { centered: true });
  }
}



