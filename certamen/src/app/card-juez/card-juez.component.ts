import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'app-card-juez',
  templateUrl: './card-juez.component.html',
  styleUrls: ['./card-juez.component.css']
})
export class CardJuezComponent implements OnInit {

  @Input() juez:any

  constructor() { }

  ngOnInit(): void {
  }

}
