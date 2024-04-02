import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListVehiculo } from '../models/list-vehiculo.interface';
import { environment } from '../environment/environment';

@Injectable({
  providedIn: 'root'
})
export class VehiculoService {

  constructor(private http: HttpClient) { }

  listVehiculos(): Observable<ListVehiculo> {
    return this.http.get<ListVehiculo>(`${environment.apiBaseUrl}/admin/vehiculos`,
    
    {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    })
  }
}
