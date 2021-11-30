import NavBar from '../src/components/NavBar'
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link
} from 'react-router-dom'
import Root from './pages/Root'
import Profile from './pages/Profile'

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element = {<Root />} />
        <Route path="profile/*" element = {<Profile />} />
      </Routes>
    </Router>
  );
}

export default App;
