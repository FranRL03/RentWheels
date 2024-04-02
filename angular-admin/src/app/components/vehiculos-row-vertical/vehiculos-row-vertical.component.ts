import { Component, OnInit, PipeTransform } from '@angular/core';
import { Transmision, Vehiculo } from '../../models/list-vehiculo.interface';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { AsyncPipe, DecimalPipe } from '@angular/common';
import { map, startWith, take } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-vehiculos-row-vertical',
  templateUrl: './vehiculos-row-vertical.component.html',
  styleUrl: './vehiculos-row-vertical.component.css',
  providers: [DecimalPipe]
})
export class VehiculosRowVerticalComponent implements OnInit {

  vehiculo!: Vehiculo[];

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    this
  }

}



