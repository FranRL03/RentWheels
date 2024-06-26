import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { CochesPageComponent } from './ui/coches-page/coches-page.component';
import { NoAdminComponent } from './ui/no-admin/no-admin.component';
import { AdminSectionComponent } from './section/admin-section/admin-section.component';
import { VehiculoFormComponent } from './ui/vehiculo-form/vehiculo-form.component';
import { VehiculoEditComponent } from './ui/vehiculo-edit/vehiculo-edit.component';
import { ModelosPageComponent } from './ui/modelos-page/modelos-page.component';
import { ModeloConVehiculosComponent } from './ui/modelo-con-vehiculos/modelo-con-vehiculos.component';
import { ListaAlquileresComponent } from './ui/lista-alquileres/lista-alquileres.component';

const routes: Routes = [
  { path: 'login', component: LoginPageComponent },
  
  { path: 'admin', component: AdminSectionComponent, children: [
    { path: 'coche', component: CochesPageComponent},
    { path: 'vehiculo/form', component: VehiculoFormComponent},
    { path: 'vehiculo/form-edit/:id', component: VehiculoEditComponent},
    { path: 'modelos', component: ModelosPageComponent},
    { path: 'modelo/:idModelo', component: ModeloConVehiculosComponent},
    { path: 'alquileres', component: ListaAlquileresComponent},

  ]},

  { path: 'no-admin', component: NoAdminComponent},
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: '**', component: LoginPageComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
