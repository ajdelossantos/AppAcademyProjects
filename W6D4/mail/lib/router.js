class Router {
  constructor(node, routes) {
    this.node = node;
    this.routes = routes;
  }

  start() {
    this.render();
    window.addEventListener("hashchange", (event) => {
      this.render();

    });

  }

  activeRoute() {
    // return window.location.hash.slice(1);
    return this.routes.slice(1);
  }

  render() {
    this.node.innerHTML = "";
    const route = this.activeRoute();
    const htmlRoute = document.createElement("p");
    htmlRoute.innerHTML = route;
    this.node.appendChild(htmlRoute);

    let component = this.activeRoute();
    this.node.innerHTML = "";
    if (component !== undefined) {
      const node = component.render();
    }

  }
}


export default Router;
