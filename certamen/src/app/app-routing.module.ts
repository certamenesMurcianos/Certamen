import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BandasComponent } from './bandas/bandas.component';
import { CreditsComponent } from './credits/credits.component';
import { Error404Component } from './error404/error404.component';
import { JuecesComponent } from './jueces/jueces.component';
import { PublicoComponent } from './publico/publico.component';

const routes: Routes = [
  {path:"publico", component: PublicoComponent},
  {path:"bandas", component: BandasComponent },
  {path:"jueces", component: JuecesComponent },
  {path:"credits", component: CreditsComponent },
  {path:"", redirectTo: "/publico", pathMatch:"full" },
  {path:"**", component: Error404Component },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
