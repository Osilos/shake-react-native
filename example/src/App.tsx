import { useEffect } from 'react';
import MainScreen from './ui/shake/MainScreen';
import DarkModeObserver from './DarkModeObserver';
import { PermissionsAndroid, Platform, type Permission } from 'react-native';

const App = () => {

  return (
    <DarkModeObserver>
      <MainScreen />
    </DarkModeObserver>
  );
};



export default App;
