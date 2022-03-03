// Keystrokes Push Key Component (v2 done)

IntList keysList = new IntList();
// GET keysList push
IntList Keystrokes()
{
    return keysList;
}
// check pressed
void keyPressed()
{
  if(keysList.size() == 0) { keysList.append(keyCode); return; }
  if(keyCode == 0) return;
  
  for(int i = 0; i < keysList.size(); i++)
  {
    if(keysList.get(i) == keyCode) return;
  }
  keysList.append(keyCode);
}
// check released
void keyReleased()
{
  if(keyCode == 0) return;
  for(int i = 0; i < keysList.size(); i++)
  {
    if(keysList.get(i) == keyCode)
    {
      keysList.remove(i);
      return;
    }
  }
}
