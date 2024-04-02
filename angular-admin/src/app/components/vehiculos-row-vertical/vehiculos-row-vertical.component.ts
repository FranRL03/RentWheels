import { Component, OnInit, PipeTransform } from '@angular/core';
import { Transmision, Vehiculo } from '../../models/list-vehiculo.interface';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { AsyncPipe, DecimalPipe } from '@angular/common';
import { map, startWith, take } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { VehiculoService } from '../../services/vehiculo.service';

@Component({
  selector: 'app-vehiculos-row-vertical',
  templateUrl: './vehiculos-row-vertical.component.html',
  styleUrl: './vehiculos-row-vertical.component.css',
})
export class VehiculosRowVerticalComponent implements OnInit {

  vehiculoList!: Vehiculo[];

  constructor(private service: VehiculoService) {}

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    this.service.listVehiculos().subscribe(resp => {
      this.vehiculoList = resp.content;
    });
  }

}



