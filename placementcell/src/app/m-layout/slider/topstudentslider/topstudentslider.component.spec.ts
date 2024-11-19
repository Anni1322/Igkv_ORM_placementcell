import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TopstudentsliderComponent } from './topstudentslider.component';

describe('TopstudentsliderComponent', () => {
  let component: TopstudentsliderComponent;
  let fixture: ComponentFixture<TopstudentsliderComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TopstudentsliderComponent]
    });
    fixture = TestBed.createComponent(TopstudentsliderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
