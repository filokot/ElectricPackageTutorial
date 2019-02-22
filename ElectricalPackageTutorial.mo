within ;
package ElectricalPackageTutorial
  extends Modelica.Icons.Package;
  package Interfaces
    connector Pin "Electrical Pin"
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Pin;

    connector PositivePin "Positive Electrical Pin"
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),graphics={Rectangle(extent={{-100,-100},{100,100}})}), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end PositivePin;

    connector NegativePin "Negative Electrical Pin"
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={Rectangle(extent={{-100,-100},{100,100}}, fillColor={0,0,0},
                fillPattern =                                                             FillPattern.Solid)}));
    end NegativePin;

    partial model OnePort
      Interfaces.PositivePin p annotation(Placement(transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.NegativePin n annotation(Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
    equation
      v = p.v - n.v;
      i = p.i;
      i = -n.i;
     annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),graphics={Rectangle(extent={{-100,-60},{100,60}})}), Diagram(
            coordinateSystem(preserveAspectRatio=false),graphics={Rectangle(extent={{-100,-60},{100,60}})}),
                  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end OnePort;
  end Interfaces;

  package Component

    model Resistor
      extends Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance R;

    equation
      v = R*i;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Resistor;

    model Ground
      Interfaces.PositivePin p annotation(Placement(transformation(extent={{-110,-10},{-90,10}})));

    equation
      p.v = 0;

      annotation (Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),graphics={Rectangle(extent={{-100,-60},{100,60}})}), Diagram(
            coordinateSystem(preserveAspectRatio=false),graphics={Rectangle(extent={{-100,-60},{100,60}})}),
                  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Ground;
  end Component;
  annotation (uses(Modelica(version="3.2.2")));
end ElectricalPackageTutorial;
