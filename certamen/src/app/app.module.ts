import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeadComponent } from './head/head.component';
import { FooterComponent } from './footer/footer.component';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { Error404Component } from './error404/error404.component';
import { PublicoComponent } from './publico/publico.component';
import { BandasComponent } from './bandas/bandas.component';
import { JuecesComponent } from './jueces/jueces.component';
import { CreditsComponent } from './credits/credits.component';
import { CardJuezComponent } from './card-juez/card-juez.component';
import { CardBandaComponent } from './card-banda/card-banda.component';

@NgModule({
  declarations: [
    AppComponent,
    HeadComponent,
    FooterComponent,
    NavBarComponent,
    Error404Component,
    PublicoComponent,
    BandasComponent,
    JuecesComponent,
    CreditsComponent,
    CardJuezComponent,
    CardBandaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
