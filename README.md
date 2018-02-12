# Lemon Reset
A set of React components that provide [Meyer Reset](https://meyerweb.com/eric/tools/css/reset/) styles for use with [CSS Modules](https://github.com/css-modules/css-modules).

For all the DOM tags used in Meyer Reset, Lemon Reset provides a React component with those reset styles, minimizing the effect of browser quirks.
In a React world, we prefer components that are self-contained and unreliant on global styling.

## Installation
```
yarn add lemon-reset
```

## Build
Our makefile assumes that you have virtualenv available globally, as we use a python environment for running[pre-commit](https://pre-commit.com/). 

If you have virtualenv, simple run:
```
make build
```

Otherwise, you can do:
```
NODE_ENV=production ./node_modules/.bin/babel src --out-dir lib --copy-files
```
## Usage
Use these components as a drop in replacement for your existing HTML tags!

```
import { P } from 'lemon-reset';

ReactDOM.render(
  <P>Hello World</P>,
  myContainer
);
```

Wrap Lemon Reset components in your own custom components!
```
import { Span, Div } from 'lemon-reset';
import styles from './Container.scss';

type Props = {
  display: 'inline' | 'inline-block' | 'block' | 'none';
}

const Container = ({children, display}: Props) {
    const Tag = display === 'inline' ? Span : Div;
    const classes = styles[`display--${display}`]
    
    return (
        <Tag className={styles[`display--${display}`]}
            { children }
        </Tag>
    )
}

export default Container;
```
