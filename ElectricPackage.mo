within ;
package ElectricPackage
  extends Modelica.Icons.Package;

  package Interfaces
    connector Pin "Electrical Pin"
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;

      annotation(Icon(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, -100},{100, 100}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 0},
                fillPattern =                                                                                                                                                                 FillPattern.Solid)}), Diagram(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, 100},{100, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 255, 0},
                fillPattern =                                                                                                                                                                 FillPattern.Solid), Text(extent={{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString
                =                                                                                                                                                                                                        "Pin")}), Documentation(info="<html> The model of the Electric Pin: the model provides interface between lumped components in the circuit </html> "));
    end Pin;

    connector PositivePin "Positive Electrical Pin"
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;

      annotation(Icon(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, -100},{100, 100}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid)}), Diagram(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, 100},{100, -100}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid), Text(extent={{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString
                =                                                                                                                                                                                                        "Pin")}), Documentation(info="<html> The model of the Electric Pin: the model provides interface between lumped components in the circuit </html> "));

    end PositivePin;

    connector NegativePin "Negative Electrical Pin"
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;

      annotation(Icon(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, -100},{100, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid)}), Diagram(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, 100},{100, -100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid), Text(extent={{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString
                =                                                                                                                                                                                                        "Pin")}), Documentation(info="<html> The model of the Negative Electric Pin: the model provides interface between lumped components in the circuit </html> "));
    end NegativePin;

    model OnePort
      Modelica.SIunits.Voltage v "Voltage drop inside the component";
        flow Modelica.SIunits.Current i "Current inside the component";
      PositivePin p annotation(Placement(transformation(extent={{-110, -10},{-90, 10}})));
      NegativePin n annotation(Placement(transformation(extent={{90, -10},{110, 10}})));

    equation
      v = p.v - n.v;
      i = p.i;
      i = -n.i;

       annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, -100},{100, 100}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-100, 60},{100, -60}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid), Text(extent={{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString
                =                                                                                                                                                                                                        "Pin")}), Documentation(info="<html> The model of the General Lumped Element </html> "));
    end OnePort;
  end Interfaces;

  model Experiment
    Components.Capacitor capacitor(          v(start = 1, fixed=true), C=1)
      annotation (Placement(transformation(extent={{-12,20},{8,40}})));
    Components.Resistor resistor1(R=1)
      annotation (Placement(transformation(extent={{-82,20},{-62,40}})));
  equation
    connect(resistor1.n, capacitor.p)
      annotation (Line(points={{-62,30},{-12,30}}, color={0,0,0}));
    connect(ground.p, capacitor.n)
      annotation (Line(points={{18,-16},{18,30},{8,30}}, color={0,0,0}));
    connect(resistor1.p, ground.p) annotation (Line(points={{-82,30},{-90,30},{
            -90,-16},{18,-16}},               color={0,0,0}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Experiment;

  package Components
    model Resistor
      extends Interfaces.OnePort;
      parameter Modelica.SIunits.Resistance R;

    equation
      v=i*R;
      annotation(Icon(corrdinateSystem(extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-70, 20},{70, -20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100, -100},{100, 100}}), graphics={Rectangle(extent={{-70, -20},{70, 20}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255},
                fillPattern =                                                                                                                                                                 FillPattern.Solid), Text(extent={{-160, 110}, {40, 50}}, lineColor = {0, 0, 255}, textString
                =                                                                                                                                                                                                        "Pin")}), Documentation(info="<html> The model of the General Lumped Element </html> "));
    end Resistor;

    model Capacitor
      extends Interfaces.OnePort;
      parameter Modelica.SIunits.Capacitance C;
    equation
      C*der(v) = i;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,0}),
            Line(points={{10,40},{10,-40}}, color={0,0,0})}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Line(points={{-10,40},{-10,-40}}, color={0,0,0}),
            Line(points={{10,40},{10,-40}}, color={0,0,0})}),
                  Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end Capacitor;
  end Components;
  annotation (uses(Modelica(version="3.2.2")));
end ElectricPackage;
