import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-card-banda',
  templateUrl: './card-banda.component.html',
  styleUrls: ['./card-banda.component.css']
})
export class CardBandaComponent implements OnInit {

  @Input() banda:any

  constructor() { }

  ngOnInit(): void {
  }

}
