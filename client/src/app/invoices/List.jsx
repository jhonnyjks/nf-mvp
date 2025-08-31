import React, { Component } from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import { getList, remove } from './duck'
import Table from '../../common/layout/Table';

class List extends Component {

    componentWillMount() {
        this.props.getList();
    }

    render() {

        return (
            <Table
                body={this.props.list}
                actions={{update: true, remove: this.props.remove}}
                pagination={this.props.pagination}
                attributesSearch={this.props.getList}
                attributes={{
                    content: { 
                        title: 'Nota Completa',
                        callback: (val, item) => <pre>{val}</pre>
                    },
                    description: 'Descrição',
                    categories: 'Categorias',
                    resume: 'Resumo'
                }}
            />
        )
    }
}

const mapStateToProps = state => ({ 
    list: state.invoice.list,
    pagination: state.invoice.pagination
 })
const mapDispatchToProps = dispatch => bindActionCreators({ getList, remove }, dispatch)

export default connect(mapStateToProps, mapDispatchToProps)(List)
