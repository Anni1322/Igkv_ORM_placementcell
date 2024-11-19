import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SShortlistComponent } from './s-shortlist.component';

describe('SShortlistComponent', () => {
  let component: SShortlistComponent;
  let fixture: ComponentFixture<SShortlistComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SShortlistComponent]
    });
    fixture = TestBed.createComponent(SShortlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
