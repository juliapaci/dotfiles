#include<bits/stdc++.h>
#define ll long long
using namespace std;

string clist="set, select - Selects a constant module to configure\nrem, remove - Removes (a) module(s) locally (script(s)+head definition(s))\ntog, toggle - toggles (a) specific module(s) on or off\nupdt, updatetime - sets the update time for (a) module(s)\nl, list - lists all (active and inactive) status bar modules (update time and signal with verbose flag)\npull - pulls (a) (specific) script(s) from github and is able to activate them\nsett, setting - shows toggleable settings for (a) module(s)\nclean - removes unused scripts and their header definitions\n-- FLAGS/OPTIONS --\n\n-r, --recursive - executes cmd recursively\n";
string fps1="config module: ",unkowncmd="unknown command. type help for help\n"+fps1;

void cmd(string str) {
  if(str.find(" ")) {
    cout<<"y";
  }
  if(str=="help")
    cout<<clist<<'\n'<<fps1;
  else if ((str=="l")||(str=="list")) {
    system(" cat -E $HOME/.local/src/dwmblocks/config.h | grep 'sb-'");
    // unfinished :(
    //system(" cat -E $HOME/.local/src/dwmblocks/config.h | grep 'sb-' >> /tmp/dwmblocksl");
    //ifstream ifs("/tmp/dwmblocksl");
    //if (!ifs) {
			//cout << "can not open file" << endl;
			//exit(EXIT_FAILURE);
		//}
    //string c( (std::istreambuf_iterator<char>(ifs) ),
                       //(std::istreambuf_iterator<char>()    ) );

    //for(int i=1;i<=count(c.begin(),c.end(),'$');i++) {
      //int ol=system("ls -1 $HOME/.local/bin/statusbar | grep 'sb-' | awk FNR=="+i);
      //cout<<ol<<'\n';
    //}
  }
  else
    cout<<unkowncmd;
}

//void cmd(string str,string arg) {
  //if(str=="help")
    //cout<<clist<<'\n'<<fps1;
  //else if (str=="l"|str=="list")
    //cout<<system("ls -1 $HOME/.local/bin/statusbar | grep 'sb-'")<<"\n";
  //else
    //cout<<unkowncmd;
//}

void greeting() {
  cout<<fps1;
  string s="";
  getline(cin,s);
  cmd(s);
  //cout<<s;
  greeting();
}

int main() {
  cout<<"⚙️ Config Module:\nUsage: <cmd> <flag(s)/option(s)> <arg(s)>\nEnter 'help' for help\n";
  greeting();
  return 0;
}
