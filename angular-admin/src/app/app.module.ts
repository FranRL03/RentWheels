import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavComponent } from './components/nav/nav.component';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { CochesPageComponent } from './ui/coches-page/coches-page.component';
import { NoAdminComponent } from './ui/no-admin/no-admin.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgbModule, NgbPopoverModule } from '@ng-bootstrap/ng-bootstrap';
import { ModalPerfilComponent } from './components/modal-perfil/modal-perfil.component';
import { AdminSectionComponent } from './section/admin-section/admin-section.component';
import { VehiculoFormComponent } from './ui/vehiculo-form/vehiculo-form.component';
import { VehiculoEditComponent } from './ui/vehiculo-edit/vehiculo-edit.component';
import { CardModelosListComponent } from './components/card-modelos-list/card-modelos-list.component';
import { ModelosPageComponent } from './ui/modelos-page/modelos-page.component';
import { ModeloConVehiculosComponent } from './ui/modelo-con-vehiculos/modelo-con-vehiculos.component';
import { CardVehiculosComponent } from './components/card-vehiculos/card-vehiculos.component';

@NgModule({
  declarations: [
    AppComponent,
    NavComponent,
    LoginPageComponent,
    CochesPageComponent,
    CardVehiculosComponent,
    NoAdminComponent,
    ModalPerfilComponent,
    AdminSectionComponent,
    VehiculoFormComponent,
    VehiculoEditComponent,
    CardModelosListComponent,
    ModelosPageComponent,
    ModeloConVehiculosComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule,
    NgbPopoverModule 
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
