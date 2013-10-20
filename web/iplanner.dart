import 'dart:html';
import 'src/st.dart';

void runAfterDBInitialize()
{
  st.GMap().initialize();
  st.FusionTable();
}

void main()
{
  st.Options().initialize(runAfterDBInitialize);
}
